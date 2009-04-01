Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lp5sO-0001NG-7U
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 19:13:35 +0000
Received: by an-out-0708.google.com with SMTP id c2so129293anc.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Apr 2009 12:13:26 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Apr 2009 12:13:25 -0700
Message-ID: <1c3f4270904011213v3ec90c98q7b942f78099c7568@mail.gmail.com>
Subject: [resend] Problem with copying a file to JFFS2 partition
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the repost, but trying again.

Hi,

I have two mtd partitions on a NAND flash and one of them keeps the
jffs2 filesystem. I can mount the jffs2 fs, read and write files off
of the mounted directory. But when I  copy a big file (11 MB) to any
location in the mounted directory, the call never returns. The
partition is 112MB big. Sometimes, a small file copy can produce the
problem. The jffs2 fs was created with cleanmarker enabled.

I enabled jffs2 debugging and I see this in dmesg:

[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11

It seems like jffs2 can't find a block to write to? What could be wrong?

Please cc me in the reply as I am not subscribed.

Thanks.
