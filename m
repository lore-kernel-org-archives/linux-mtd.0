Received: from mail-fx0-f217.google.com ([209.85.220.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NxG2c-0007qi-K6
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 08:46:20 +0000
Received: by fxm9 with SMTP id 9so784811fxm.4
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Apr 2010 01:46:15 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <201003052234.47983.fabio.giovagnini@aurion-tech.com>
References: <201003052234.47983.fabio.giovagnini@aurion-tech.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 1 Apr 2010 10:45:54 +0200
Message-ID: <y2kb8e9195f1004010145iae8bd95t3b5066c747d363b6@mail.gmail.com>
Subject: Re: Hi All, problem with SST39VF6401B70
To: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/3/5 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>:
> Hi All.
> This is my problem
> I'musing SST39VF6401B70 as a boot NOR flash; when gen_probe module
> check_cmd_set function is called detect my flash as an AMDSTD and this
> because of CFI Query struct bytes 13H and 14H =C2=A0(Primary OEM commad s=
et) is
> 0002H, 0000H as an AMD standard; but CFI Query struct bytes 15H and 16H
> (Address for Primary Extended Table) is 0000H (no table); this is not con=
form
> to ADMSTD. How can I solve the problem? Do I have to implement a differen=
t
> driver and if yes where can I find the road map?

Hi.

I created a patch series that could address your issue :

http://lists.infradead.org/pipermail/linux-mtd/2010-March/029461.html

Feel free to try it and send me some report back.

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
