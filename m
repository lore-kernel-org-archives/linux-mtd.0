Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi6Sk-0001kc-9N
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 14:35:11 +0000
Received: by wyf22 with SMTP id 22so934972wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 06:35:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4D3E9AA1.4020308@bvs-tech.com>
References: <327178.68946.qm@web180303.mail.gq1.yahoo.com>
	<4CEB89C6.3080603@bvs-tech.com>
	<20101123093643.GC6156@jasper.tkos.co.il>
	<4CEB8C39.1060801@bvs-tech.com>
	<20101123094414.GD6156@jasper.tkos.co.il>
	<4CEB8F7C.6070102@bvs-tech.com>
	<20110121192819.GA32112@angua.secretlab.ca>
	<4D3D6472.8030505@bvs-tech.com> <4D3D9FA6.3050900@bvs-tech.com>
	<AANLkTikDHbKt5q+o2LK89hHZ3EUeeYzmQVJj8jXgQ+pB@mail.gmail.com>
	<4D3E9AA1.4020308@bvs-tech.com>
Date: Wed, 26 Jan 2011 09:35:07 -0500
Message-ID: <AANLkTike6cF+VyNVP9M94=B-bMBpp5VAX4dvLkVceqeP@mail.gmail.com>
Subject: Re: [PATCH 0/1] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
From: Josh Boyer <jwboyer@gmail.com>
To: Alexis RODET <alexis.rodet@bvs-tech.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>, Baruch Siach <baruch@tkos.co.il>,
	Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 25, 2011 at 4:40 AM, Alexis RODET <alexis.rodet@bvs-tech.com> w=
rote:
> Hello,
>
> Le 24/01/2011 18:52, Grant Likely a =E9crit :
>> On Mon, Jan 24, 2011 at 8:49 AM, Alexis RODET <alexis.rodet@bvs-tech.com=
> wrote:
>>> Hi again,
>>>
>>> In facts I don't know which git URL to clone for getting linux-next as =
patch base, can you tell me ?
>>> I'm working on last stable release from git://git.kernel.org/pub/scm/li=
nux/kernel/git/stable/linux-2.6-stable.git.
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
>> Be warned, it is rebased every night.
>>
> It seems to have been frozen for 4 days and to have become late behind gi=
t://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Stephen said something elsewhere about not generating a new one until
Jan 31.  I would suspect this has to do with LCA going on right now.

josh
