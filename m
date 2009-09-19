Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mp6Y4-0000ZC-UR
	for linux-mtd@lists.infradead.org; Sat, 19 Sep 2009 20:28:53 +0000
Received: by qw-out-1920.google.com with SMTP id 5so669274qwf.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Sep 2009 13:28:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253390936.6317.33.camel@macbook.infradead.org>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 19 Sep 2009 16:28:26 -0400
Message-ID: <8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible flash
	chip driver
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 19, 2009 at 16:08, David Woodhouse wrote:
> On Sat, 2009-06-13 at 06:59 -0400, Mike Frysinger wrote:
>> The ST PSD4256G Flash In-System Programming (ISP) part is a multifunctio=
n
>> device. =C2=A0Since all of the different pieces are memory mapped, this =
is a
>> driver for the NOR flash component. =C2=A0All the other pieces can use g=
eneric
>> memory based drivers. =C2=A0Unfortunately, this is not a CFI compliant p=
art in
>> any way, so we need a dedicated chip driver for it.
>
> Hrm. This looks very similar to cfi_cmdset_0002.c, which we _do_ already
> use with non-CFI-compliant parts.
>
> CFI is just the _probe_ method. We can probe chips using the JEDEC
> method too, and that works just fine -- jedec_probe.c will "invoke" the
> appropriate command set driver.
>
> Can't you do the same?

afaik, it isnt JEDEC compliant either.  you can find the data sheet here:
http://www.st.com/stonline/products/literature/ds/8116/psd4256g6v.htm

so if i created a probe function that created a fake cfi table and
then called cfi_cmdset_0002(), you think the read/write/erase
functions would work ?  i dont see any mapping drivers that do this
kind of thing.  where can i find an example ?
-mike
