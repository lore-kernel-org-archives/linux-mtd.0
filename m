Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWVr0-0005m4-6e
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 13:39:34 +0000
Received: by qw-out-1920.google.com with SMTP id 5so954643qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 06:39:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A719A27.8050509@linutronix.de>
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 19:09:09 +0530
Message-ID: <ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, kay.sievers@vrfy.org, gregkh@suse.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	sr@denx.de, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 6:33 PM, Sebastian Andrzej
Siewior<bigeasy@linutronix.de> wrote:
> Stoyan Gaydarov wrote:
>>
>> Resubmit of a patch with some additions, see
>> http://lkml.org/lkml/2009/7/30/97
>>
> Please add a description of the path here. That's the place where people
> are looking for them. The link might be a an additional reference.
>
>> Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
>> ---
>> =A0drivers/mtd/maps/physmap_of.c | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of=
.c
>> index 39d357b..e7ab5f0 100644
>> --- a/drivers/mtd/maps/physmap_of.c
>> +++ b/drivers/mtd/maps/physmap_of.c
>> @@ -215,7 +215,8 @@ static int __devinit of_flash_probe(struct of_device
>> *dev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_out;
>> =A0 =A0 =A0 =A0 =A0mtd_list =3D kzalloc(sizeof(struct mtd_info) * count,=
 GFP_KERNEL);
>> - =A0 =A0 =A0 if (!info)
>> + =A0 =A0 =A0 if (!mtd_list)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_out;

What if you go to 'err_out' due to some other error?? Do not you need
to free 'info'?
So, better free it in at the label.

Currently label is like below, which is again incorrect.
-----code snippet (line 339)-----
err_out:
        kfree(mtd_list);
        of_flash_remove(dev);
-------------------------------------------
Think about when you get jump to this label even before 'mtd_list' is
allocated. This is the scenario of null pointer dereferencing.

So, this requires two separate labels:
-one label for errors which occur before 'mtd_list' memory allocation
-and, another for then onward errors

something like below:

err_out2:
        kfree(info);
        kfree(mtd_list);
err_out1:
        of_flash_remove(dev);

-vimal

>
> This is not python, you have to be explicit about braces. Now your code
> looks like this:
>
> =A0 =A0 =A0 =A0mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP_=
KERNEL);
> =A0 =A0 =A0 =A0if (!mtd_list)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(info);
> =A0 =A0 =A0 =A0goto err_out;
>>
>> =A0 =A0 =A0 =A0 =A0dev_set_drvdata(&dev->dev, info);
>
>
> Sebastian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
