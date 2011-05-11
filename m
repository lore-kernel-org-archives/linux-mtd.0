Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKBUP-00017B-2C
	for linux-mtd@lists.infradead.org; Wed, 11 May 2011 15:38:17 +0000
Received: by ywf9 with SMTP id 9so236651ywf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 May 2011 08:38:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110511145431.GA18317@kroah.com>
References: <1305123897-11371-1-git-send-email-kishore.kadiyala@ti.com>
	<20110511145431.GA18317@kroah.com>
From: Kishore Kadiyala <kishorek.kadiyala@gmail.com>
Date: Wed, 11 May 2011 21:07:55 +0530
Message-ID: <BANLkTinsZsBhVbcGRnx0fzWwA2Q0f4Fs3w@mail.gmail.com>
Subject: Re: [stable] [PATCH RESEND] omap : nand : fix subpage ecc issue with
	prefetch
To: Greg KH <greg@kroah.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, Kishore Kadiyala <kishore.kadiyala@ti.com>,
	Vimal Singh <vimal.newwork@gmail.com>,
	linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
	stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 11, 2011 at 8:24 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, May 11, 2011 at 07:54:57PM +0530, Kishore Kadiyala wrote:
>> When reading/writing a subpage (When HW ECC is not available/enabled)
>> for number of bytes not aligned to 4, the mis-aligned bytes are handled
>> first (by cpu copy method) before enabling the Prefetch engine to/from
>> 'p'(start of buffer 'buf'). Then it reads/writes rest of the bytes with
>> the help of Prefetch engine, if available, or again using cpu copy metho=
d.
>> Currently, reading/writing of rest of bytes, is not done correctly since
>> its trying to read/write again to/from begining of buffer 'buf',
>> overwriting the mis-aligned bytes.
>>
>> Read & write using prefetch engine got broken in commit '2c01946c'.
>> We never hit a scenario of not getting 'gpmc_prefetch_enable' call
>> success. So, problem did not get caught up.
>>
>> Signed-off-by: Kishore Kadiyala <kishore.kadiyala@ti.com>
>> Signed-off-by: Vimal Singh <vimal.newwork@gmail.com>
>> Reported-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
>> ---
>> =A0drivers/mtd/nand/omap2.c | =A0 12 +++++-------
>> =A01 files changed, 5 insertions(+), 7 deletions(-)
>
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree. =A0Please read Documentation/stable_kernel_rules.txt
> for how to do this properly.

Ok, will post it properly.

Regards,
Kishore
>
> </formletter>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
