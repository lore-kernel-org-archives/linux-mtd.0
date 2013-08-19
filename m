Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBPwU-0006cE-NM
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 13:56:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by anubis.se.axis.com (Postfix) with ESMTP id 9881F19D09
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 15:55:56 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
 by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iBGSlcBuv4Kn for <linux-mtd@lists.infradead.org>;
 Mon, 19 Aug 2013 15:55:55 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by anubis.se.axis.com (Postfix) with ESMTP id C3CD019D06
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 15:55:53 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id AD42B5B9
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 15:55:53 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by boulder.se.axis.com (Postfix) with ESMTP id A252788C
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 15:55:53 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by thoth.se.axis.com (Postfix) with ESMTP id A0CCD3404E
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 15:55:53 +0200 (CEST)
Date: Mon, 19 Aug 2013 15:55:53 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: temporary files on mtd file systems
Message-ID: <alpine.DEB.2.00.1308191539170.3183@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I came across a problem the other day, which while maybe not directly 
related to ordinary mtd issues, it's something which perhaps someone else 
has come across and has some form of solution to.

When writing to a file on for instance an ubifs file system, there's 
always the problem that the power may fail at any moment, leaving the file 
in an inconsistent state.

The remedy for this is to first write to a temporary file, and then rename 
the file to the real one. Since the rename is an atomic operation, one 
will either get the original file or the new one.

Traditionally when creating a temporary file, it is recommended to use 
mkstemp(3) and friends, which will guarantee that the temporary file will 
have a unique file name that will not clash with anything else.

However, in the case of a file on a persistent file system, the following 
chain of events could occur:

1. A file is to be updated, say, foo, so a new temporary file (say,
    foo.1234567) is created, using mkstemp.
2. Data is written to the file.
3. Due to timeouts, or an explicit sync call, the file is written out to
    the media, so there is a foo.1234567 on the flash.
4. Power failure.
5. System starts up again, and again, the file is to be updated. Thus, a
    new temporary file is created, this time using a new name, say,
    foo.2345678 .
6. Operation goes as planned, and foo.2345678 is renamed to foo, thus
    removing foo.2345678

In this scenario, the old file foo.1234567 remains on the system and is 
never removed. Eventually a lot of such operations will cause the file 
system to fill up with temporary files.

Am I missing something here, or is there a "good" way to deal with this? 
Of course there are several cleanup scenarios that could be imagened, such 
as cleaning out all 'foo.*' files during boot for instance.

For applications that are not multi threaded, i.e. there may only be one 
process updating foo, one way is to use the same temporary file name each 
time, e.g. foo.temp. But things get awkward when using for instance glib, 
which has a nice g_file_set_contents() call, complete with temporary file 
handling and all, but which uses mkstemp as above to create the temporary 
file, so there is no easy way of telling glib what filename to use, short 
of rewriting a local function which indeed uses a constant temporary file 
name.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
