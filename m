From: David Woodhouse <dwmw2@infradead.org>
To: Russ Dill <russ.dill@gmail.com>
In-Reply-To: <f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<4461CC8C.6010105@ru.mvista.com>
	<f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 11 May 2006 23:26:02 +0100
Message-Id: <1147386362.12030.9.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	Josh Boyer <jwboyer@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-05-11 at 12:06 -0700, Russ Dill wrote:
> Free block list? Bad block list? Tracking of block numbers? Sounds
> like a full on FTL to me. 

A full read-write FTL needs to handle 512-byte writes if it's going to
pretend to be a normal block device. A simple FTL for read-only stuff
like cramfs/squashfs doesn't need that.

We should probably do this kind of thing as an FTL -- we already have
the 'mtd_blkdevs' infrastructure to help you by doing most of the
interfacing to MTD and block layers for you. And then you can use any
read-only file system on it.

-- 
dwmw2
