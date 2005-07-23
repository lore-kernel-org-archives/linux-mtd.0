Received: from cipe.mpl.ch ([195.134.130.77] helo=mail.mpl.ch)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DwDAk-0007dw-Jy
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2005 02:07:52 -0400
Message-ID: <42E1DA4C.1000605@elsoft.ch>
Date: Sat, 23 Jul 2005 07:49:00 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
	<d.mueller@elsoft.ch>
MIME-Version: 1.0
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
References: <dbr15p$90f$1@sea.gmane.org>
In-Reply-To: <dbr15p$90f$1@sea.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Howto provoke the long mount times?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

Martin Egholm Nielsen wrote:
> In extension of my previous thread regarding the GC blocking writes to
> the NAND, I have a small additional question:
> 
> How can I provoke this situation?
> It suddenly occur "out of nowhere" - having mount times of nearly
> nothing, to having mount times of minutes (now reduced, though)...

Most probably you are facing the same problem as i have reported in
http://lists.infradead.org/pipermail/linux-mtd/2005-May/012675.html
while creating tar files.

In the meantime i can provoke the same effect also be "copying" serveral
hundred small files (~ 700 bytes) to the NAND flash using the following
"poor mans" copy routine:

static void
Copy(FILE *fi, FILE *fo, size_t bsize)
{
	size_t rlen, wlen;
	char buf[BUFFERSIZE];

	while (!feof(fi)) {
		rlen = fread(&buf, 1, bsize, fi);
		wlen = fwrite(&buf, 1, rlen, fo);
		fflush(fo);

		if (rlen != wlen)
			return;
	}
}


Please note the "fflush()" after the "fwrite()". By varying the "bsize"
parameter and the numbers of files to copy, you should be able to select
the "desired" delay during mount time.


Dave
