Received: from mail-gx0-f208.google.com ([209.85.217.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZW8y-00066b-O2
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 20:02:15 +0000
Received: by gxk4 with SMTP id 4so4525640gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Feb 2009 12:02:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1234601859.3564.95.camel@macbook.infradead.org>
References: <200902112112.n1BLCKlR010256@imap1.linux-foundation.org>
	<20090212.093531.235975795.nemoto@toshiba-tops.co.jp>
	<20090211164247.8119de8d.akpm@linux-foundation.org>
	<1234601859.3564.95.camel@macbook.infradead.org>
Date: Tue, 17 Feb 2009 15:02:11 -0500
Message-ID: <8bd0f97a0902171202i449ede68k3dd726039b4c2f4a@mail.gmail.com>
Subject: Re: [patch for 2.6.29? 4/4] mtd/maps: blackfin async flash maps: fix
	up memory leak
From: Mike Frysinger <vapier.adi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary=0015174c445859e3e6046322c78b
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>, cooloney@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0015174c445859e3e6046322c78b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sat, Feb 14, 2009 at 03:57, David Woodhouse wrote:
> On Wed, 2009-02-11 at 16:42 -0800, Andrew Morton wrote:
>> > Revised patch for physmap driver is:
>> >
>> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024590.html
>> >
>> > Mike, please update this blackfin patch too.
>> >
>>
>> I don't have a copy of that patch.  You're on you own, guys..
>
> Er, wasn't your [1/4] actually Nemoto-san's latest physmap patch?
>
> Mike, please can I have an updated version of the blackfin patch?
>
> Nemoto-san, thank you for taking care of this.

i'm not entirely sure what the change is by reading that patch.  what
i've got is attached.
-mike

--0015174c445859e3e6046322c78b
Content-Type: text/x-patch; charset=US-ASCII; name="bfin-async-flash-parts-leak.patch"
Content-Disposition: attachment;
	filename="bfin-async-flash-parts-leak.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_frb04gid0

LS0tIGEvZHJpdmVycy9tdGQvbWFwcy9iZmluLWFzeW5jLWZsYXNoLmMKKysrIGIvZHJpdmVycy9t
dGQvbWFwcy9iZmluLWFzeW5jLWZsYXNoLmMKQEAgLTQxLDQgKzQxLDcgQEAKIAl1aW50MzJfdCBz
YXZlX2FtYmN0bDAsIHNhdmVfYW1iY3RsMTsKIAl1bnNpZ25lZCBsb25nIGlycV9mbGFnczsKKyNp
ZmRlZiBDT05GSUdfTVREX1BBUlRJVElPTlMKKwlzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHM7
CisjZW5kaWYKIH07CiAKQEAgLTE2Nyw0ICsxNzQsNSBAQAogCQlwcl9kZXZpbml0KEtFUk5fTk9U
SUNFIERSSVZFUl9OQU1FICI6IFVzaW5nIGNvbW1hbmRsaW5lIHBhcnRpdGlvbiBkZWZpbml0aW9u
XG4iKTsKIAkJYWRkX210ZF9wYXJ0aXRpb25zKHN0YXRlLT5tdGQsIHBkYXRhLT5wYXJ0cywgcmV0
KTsKKwkJc3RhdGUtPnBhcnRzID0gcGRhdGEtPnBhcnRzOwogCiAJfSBlbHNlIGlmIChwZGF0YS0+
bnJfcGFydHMpIHsKQEAgLTE5MCw0ICsxOTgsNSBAQAogI2lmZGVmIENPTkZJR19NVERfUEFSVElU
SU9OUwogCWRlbF9tdGRfcGFydGl0aW9ucyhzdGF0ZS0+bXRkKTsKKwlrZnJlZShzdGF0ZS0+cGFy
dHMpOwogI2VuZGlmCiAJbWFwX2Rlc3Ryb3koc3RhdGUtPm10ZCk7Cg==
--0015174c445859e3e6046322c78b--
