Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbXHR-0005VG-So
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 16:38:47 +0000
Message-ID: <55158773.2080502@rempel-privat.de>
Date: Fri, 27 Mar 2015 17:38:11 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Nick Krause <xerofoify@gmail.com>
Subject: Re: Help Out
References: <CAPDOMVgj0qaqfEdZRNHKRqwCbuUZTRu3GcSuAqknhUYa4u9crg@mail.gmail.com>	<551560BB.3050607@rempel-privat.de>	<3BA9F386-DDC1-4C9E-855A-5D28B45BDD0B@gmail.com>	<55157648.9020907@rempel-privat.de>
 <CAPDOMVh4YMVew=b9-HkDxbLG3C3gz4HT5m0e-NT38vivJOUyYA@mail.gmail.com>
In-Reply-To: <CAPDOMVh4YMVew=b9-HkDxbLG3C3gz4HT5m0e-NT38vivJOUyYA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jWQ0m8DLCa2F8FWXotvj9dK9It0VEUBhw"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jWQ0m8DLCa2F8FWXotvj9dK9It0VEUBhw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 27.03.2015 um 17:02 schrieb Nick Krause:
> On Fri, Mar 27, 2015 at 11:24 AM, Oleksij Rempel <linux@rempel-privat.d=
e> wrote:
>> Am 27.03.2015 um 15:20 schrieb Nicholas Krause:
>>>
>>>
>>> On March 27, 2015 9:52:59 AM EDT, Oleksij Rempel <linux@rempel-privat=
=2Ede> wrote:
>>>> Am 27.03.2015 um 14:22 schrieb Nick Krause:
>>>>> Greetings All,
>>>>> I have been reading this list for the last few weeks and was
>>>> wondering
>>>>> how I can start contributing.
>>>>> Further more I have some understanding of kernel internals and file=

>>>>> systems related to Linux so
>>>>> helping out would be no problem, if there are any requests for wher=
e
>>>> I
>>>>> should start please let me
>>>>> known.
>>>>> Thanks,
>>>>> Nick
>>>>
>>>> Just get some hardware and start play with it. Try to brake it or wr=
ite
>>>> a new driver. After some work you will see how match work is needed =
:)
>>> Olaf,
>>> That's the issue,  I don't know where to
>>> purchase a board with mtd flash on it.
>>> If you can point to where I can purchase a rather inexpensive board f=
or this that would be great. Furthermore I was interested in how we are d=
oing with fixing the issue relating to handling data concisely if there i=
s a  power failure when writing to the flash on the system.
>>> Nick
>>
>> Not sure if i can suggest you exact board. Probably i can give you som=
e
>> direction. Since you wish to play with file system, then you probably
>> need some think bigger then 8MB of storage. In this case NAND will be
>> better choice.
>> You will need a SOC/Board with:
>> - NAND controller
>> - as match open as possible - you will need to work with latest vanill=
a
>> kernel source.
>>
>> - MIPS Creator CI20
>> - ASM9260t eval board (i work on upstreaming. if you wish to work on
>> this, we can talk about it)
>>
>> Other options with nand on board? Or other suggestions?
>>
>> --
>> Regards,
>> Oleksij
>>
> I would be glad to help you upstream the board you are working on.
> Cheers,
> Nick

About this project,

- it is a SoC produced in China by some no name company
- None of persons working on this project will probably ever be able to
get money on it
- our target is to have open and as chap as possible board.

You will need:
- own evaluation board and some jtag adapter for openocd (i use bus
blaster v3, some thing else should work too)
- probably most important, fix you patch and community skills - if i see
it correctly, your reputation need really hard work to be acceptable.

If you ok with all this, send me privately you skype name. It is
probably most stable way to communicate with devs in china.

--=20
Regards,
Oleksij


--jWQ0m8DLCa2F8FWXotvj9dK9It0VEUBhw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlUVh3gACgkQHwImuRkmbWn9FgD+MtZP/AzFgE6uWoqzkt16CN6S
/o5zUzBwgfLSNauafxkA/iTPd1m5j0KHV+vhbyqw6n4ZZNlRURhedhkSQnNB67n+
=vBKZ
-----END PGP SIGNATURE-----

--jWQ0m8DLCa2F8FWXotvj9dK9It0VEUBhw--
