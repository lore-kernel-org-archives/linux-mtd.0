Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvkCW-0006Bq-G7
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 17:39:22 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0VMdGFM022979
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 17:39:16 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0VMdGEF146922
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 17:39:16 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0VMdGAI028946
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 17:39:16 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1107190071.2480.150.camel@fuzzie.sanpeople.com>
References: <1107190071.2480.150.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Mon, 31 Jan 2005 16:39:10 -0600
Message-Id: <1107211150.7567.43.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 18:47 +0200, Andrew Victor wrote:

(Note, quoting patches is hard to do when they are sent as attachments).

>@@ -435,7 +435,7 @@
>           if we have a switch to next page, we will not have
>           enough remaining space for this. 
>        */
>-       if (pad) {
>+       if (pad && jffs2_cleanmarker_oob(c)) {
>                c->wbuf_len = PAD(c->wbuf_len);

Why did you do this?  Now padding nodes don't get written out on NOR ECC
flashes.

Could you update the Kconfig file as well?  Config.in is 2.4 only and
I'm sure 2.6 people would like to use this.

Also, could you send the patch inline next time?  Makes it easier to
comment on.

thx,
josh
