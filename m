Date: Wed, 22 Dec 2004 18:20:44 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: xemc <xemcnet@gmail.com>
In-Reply-To: <1f9886eb0412221014256b83e6@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0412221815120.30689@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't investigate this. But may be I will do. Anyway, it should be 
done.

But not all flashes are protected by ECC and I believe we want to have the 
same nodes format for any flash. From the another hand, those who not 
protected are robust.

Now I may only say about CRC32 - with properly selected polnome it 
protects 1, 2 bit errors and burst of consequitive bit errors. At least papers 
I've read stand this.

On Wed, 22 Dec 2004, xemc wrote:

> > adler32 is strong agains 1bit errors:
> ...
> > adler32 is relatively strong against 2bit erros:
> ... 
> > For higher level errors, adler32 should have the usual a-priori
> > chances of catching them.
> ...
> > Overall, it is not as good as crc32, but pretty close, esp. for long
> > data.  I would entrust my personal data to it, provided that the
> > device in general is good enough and the first adler32 checksum
> > failure (ignoring power-failure during writes) results in a message to
> > discard the broken flash chips or something similar.
> 
> Please forgive me if this is a naive question, but isn't this data
> also protected by ECC in the first place?  (or is that just for NAND?)
>  How strong is this ECC compared to CRC32 or Adler32?
> 
> If the ECC can handle a few bit errors, then wouldn't a simple
> checksum handle the case where the file was completely corrupt or
> partially written?
> 
> Please correct any wrong assumptions.
> Thanks,
> Mike
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
