Received: from fsmsg0305.sp.f-secure.com ([46.228.130.255])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP2GY-0004IZ-SM
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 05:38:27 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: Andrew Murray <amurray@embedded-bits.co.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
Date: Tue, 11 Aug 2015 05:38:20 +0000
Message-ID: <55C98A3B.3010405@exertus.fi>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
In-Reply-To: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <5DA1B59684051945A7BBAD7A60274AD5@exertus.fi>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been lurking in this list for a long time and this is my first
post here. I decided to write because I think I have yet another idea
for this one:

On 10.08.2015 22:56, Andrew Murray wrote:
> ...
>  - My work around for this erased flash issue was to conditionally
>    encrypt/decrypt only when the input data is not 'all bits set'. This h=
ad
>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlike=
ly)
>    that the output of an encryption algorithm is 'all bits set' - Thus wh=
en you
>    later attempt to decrypt the 'all bits set' cipher text we incorrectly=
 treat
>    it as erased flash so return it verbatim and thus cause corruption. I'=
ve not
>    seen this issue occur despite reading and writing more than 50GB of da=
ta.
> ...

Why not postprocess the data so that the encrypted FF becomes FF again
like this:

Lets say clear text data is I, encrypted data is O, encryption function
is e() and decryption function is d(). Then, what is normally done, is
of course:

Write: O =3D e(I)
Read: I =3D d(O)

Calculate F =3D ~e(FF), where F is encrypted and inverted version of 'all
bits set' (FF) data, and modify writing and reading:

Write: O =3D e(I) ^ F
Read: I =3D d(O ^ F)

Now encrypting FF input results in FF output and vice versa.

Just wanted to introduce an idea.

--

Timo
