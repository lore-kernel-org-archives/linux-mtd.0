Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5eif-0008Hb-T3
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 13:16:42 +0000
Received: by pwi2 with SMTP id 2so938723pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 06:16:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286825063.1742.13.camel@brekeke>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
Date: Tue, 12 Oct 2010 15:16:40 +0200
Message-ID: <AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Karl Beldan <karl.beldan@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 11, 2010 at 9:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
>> Hi,
>>
>> I have been using this tweak for some time now, and I am getting tired o=
f
>> having to resort to it so often.
>> It allows to pass such cmdline root as:
>> =C2=A0"root=3Dmtdb:ubivolx rootfstype=3Dsquashfs"
>> I am pretty sure many people use squashfs/cramfs filesystems on top of n=
and,
>> for example, and I thought that this might initiate discussion.
>>
>> --
>> Karl
>>
>> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
>> ---
>> =C2=A0init/do_mounts.c | =C2=A0 15 +++++++++++++--
>> =C2=A01 files changed, 13 insertions(+), 2 deletions(-)
>
> Dunno...
>
> First of all, if you have to do this, let it be mtdblock, not mtdb - no
> need to breed aliases.
>
> But how about teaching squashfs to understand mtdX and mtd:name syntax
> instead?
>

Hi Artem,

I would not do that, squashfs and co just ask for a block device, putting m=
tdx
syntax awareness in each of them just does not seem a good fit to me.

BTW 'for-2.6.37' got https://patchwork.kernel.org/patch/145681/.



Regards,

--=20
Karl Beldan
