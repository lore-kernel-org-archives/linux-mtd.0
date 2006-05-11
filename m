Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeKfv-0004YR-HH
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 19:34:40 -0400
Received: by ug-out-1314.google.com with SMTP id u40so233218ugc
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 16:34:28 -0700 (PDT)
Message-ID: <625fc13d0605111634le211be8teb330af6c00d53f@mail.gmail.com>
Date: Thu, 11 May 2006 18:34:28 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Russ Dill" <russ.dill@gmail.com>
In-Reply-To: <f9d2a5e10605111626u743b101dgfc7e90422dec9a80@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<4461CC8C.6010105@ru.mvista.com>
	<f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
	<1147386362.12030.9.camel@shinybook.infradead.org>
	<f9d2a5e10605111626u743b101dgfc7e90422dec9a80@mail.gmail.com>
Cc: Vitaly Wool <vwool@ru.mvista.com>, David Woodhouse <dwmw2@infradead.org>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/11/06, Russ Dill <russ.dill@gmail.com> wrote:
> > > Free block list? Bad block list? Tracking of block numbers? Sounds
> > > like a full on FTL to me.
> >
> > A full read-write FTL needs to handle 512-byte writes if it's going to
> > pretend to be a normal block device. A simple FTL for read-only stuff
> > like cramfs/squashfs doesn't need that.
> >
> > We should probably do this kind of thing as an FTL -- we already have
> > the 'mtd_blkdevs' infrastructure to help you by doing most of the
> > interfacing to MTD and block layers for you. And then you can use any
> > read-only file system on it.
>
> True, I also realized another possible shortcut. If a blocks gets an
> ECC correction on a read, rewrite it to a free block, erase the block,
> rewrite it from the data written to the free block, and then erase the
> free block. You'd need to put some info in the OOB so you could know
> what the state is on power recovery.

Um, or simply leave the copied block alone, erase the original block
and use it as the spare now.  You only need a single block for
scrubbing.

josh
