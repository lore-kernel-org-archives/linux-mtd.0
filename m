Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Mpev-0004uV-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jan 2002 12:10:45 +0000
Received: from d1o72.telia.com (d1o72.telia.com [62.20.150.241])
	by maila.telia.com (8.11.6/8.11.6) with ESMTP id g05CLfr03613
	for <linux-mtd@lists.infradead.org>; Sat, 5 Jan 2002 13:21:41 +0100 (CET)
Received: from jocke (t7o72p90.telia.com [213.64.146.90])
	by d1o72.telia.com (8.8.8/8.8.8) with SMTP id NAA04971
	for <linux-mtd@lists.infradead.org>; Sat, 5 Jan 2002 13:21:40 +0100 (CET)
Message-ID: <001001c195e3$cd5fb180$5a9240d5@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: CLEANMARKER question
Date: Sat, 5 Jan 2002 13:23:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>joakim.tjernlund@lumentis.se said:
>> OK, I suspected that much. So after a CLEANMARKER there can be a
>> NODETYPE_INODE or a NODETYPE_DIRENT?
>
>Or indeed any other type of node, when new ones get invented - yes.
>
>> Why do you do 2 scan_empty() calls in scan_eraseblock() ?
>
>Consider it loop unrolling.
>
>> Well, sofar I have only identified one improvement. One could add an
>> isempty() function in the mtd layer. That would improve scaning for
>> empy flash so that you dont have to mtd->read() into a buffer and then
>> check the buffer for 0xffffffff. How does that sound?
>
>Sounds ugly, but could be effective. Want to benchmark it to see if it's
>really worth it?

I did a very ugly hack to see if there was a big difference.
on my FS(¨~62 MB flash partition, 31% in use) it took
12.2 sec to mount with my ugly hack and it
tackes 13.3 sec without the ugly hack.

I guess it's not worth it.

>
>
>If there's a way to safely avoid having to check all the node CRCs on
>mount, that would also help.

Yes, I once commented out all crc checking in scan just to see what happened
and there was a difference, but I can not remeber how much.

>
>The most useful thing to do, though, would probably be to implement
>checkpointing.
I have seen alot of posts about it but I have no idea on how to proceed
with this.

Would checkpointing  still speed up mount when power is cut and then
restored?
