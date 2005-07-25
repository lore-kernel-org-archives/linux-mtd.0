Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DwxHN-0001nZ-7B
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2005 03:21:40 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DwxGu-0000O9-VL
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2005 09:21:08 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jul 2005 09:21:08 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jul 2005 09:21:08 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Mon, 25 Jul 2005 09:20:43 +0200
Message-ID: <dc23sc$s8p$1@sea.gmane.org>
References: <dbr15p$90f$1@sea.gmane.org> <42E1DA4C.1000605@elsoft.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <42E1DA4C.1000605@elsoft.ch>
Sender: news <news@sea.gmane.org>
Subject: Re: Howto provoke the long mount times?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>In extension of my previous thread regarding the GC blocking writes to
>>the NAND, I have a small additional question:
>>How can I provoke this situation?
>>It suddenly occur "out of nowhere" - having mount times of nearly
>>nothing, to having mount times of minutes (now reduced, though)...
> Most probably you are facing the same problem as i have reported in
> http://lists.infradead.org/pipermail/linux-mtd/2005-May/012675.html
> while creating tar files.
Most likely, yes! :-)
Did you stay with jffs2 or did you turn to yaffs?

> In the meantime i can provoke the same effect also be "copying" serveral
> hundred small files (~ 700 bytes) to the NAND flash using the following
> "poor mans" copy routine:

> static void
> Copy(FILE *fi, FILE *fo, size_t bsize)
> {
> 	size_t rlen, wlen;
> 	char buf[BUFFERSIZE];
> 
> 	while (!feof(fi)) {
> 		rlen = fread(&buf, 1, bsize, fi);
> 		wlen = fwrite(&buf, 1, rlen, fo);
> 		fflush(fo);
> 
> 		if (rlen != wlen)
> 			return;
> 	}
> }
> 
> 
> Please note the "fflush()" after the "fwrite()". By varying the "bsize"
> parameter and the numbers of files to copy, you should be able to select
> the "desired" delay during mount time.

Super! Nice to have in case I "repair" (flash_eraseall) the flashes I 
have, but need to test the behaviour for future versions...

BR,
  Martin
