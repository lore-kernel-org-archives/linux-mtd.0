Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELGjY-0006LN-ID
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 04:59:22 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Peter Grayson <pgrayson@realmsys.com>
In-Reply-To: <1128053984.6926.59.camel@localhost.localdomain>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
	<1128053984.6926.59.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 12:58:34 +0400
Message-Id: <1128070714.4267.8.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-29 at 22:19 -0600, Peter Grayson wrote:
> I was a little unsure about what you meant by "time to first write".
> How's this?:

Could you please create a 200MB file 'dedekind' (or larger, the larger -
the better), mount your FS, run 'time stat dedekind' and report how much
time did that command stat took.

Also, just after mount of a fully filled FS (again, the larger is your
FS, the better), run top, and look how much time your cpu is busy by
executing the GC thread. Basically, you can start writing only after the
GC thread has stopped working.

I am really curious about the results. 

And another fun is to create a directory with thousands of small (or
empty) files, remount the FS and run stat on the directory or enter it.
But this is not that fundamental problem and may be fixed.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
