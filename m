Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjbBs-0001qj-KW
	for linux-mtd@lists.infradead.org; Sun, 30 Jan 2011 17:35:57 +0000
Received: by bwz5 with SMTP id 5so4919423bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jan 2011 09:35:53 -0800 (PST)
Subject: Re: [PATCH] mtd: fix memory leak
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Mathias Krause <minipli@googlemail.com>
In-Reply-To: <1296399153.2388.57.camel@localhost>
Date: Sun, 30 Jan 2011 18:35:48 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <168EA60D-68D1-4281-A0C2-22B2B598AFE1@googlemail.com>
References: <1296379908-10150-1-git-send-email-minipli@googlemail.com>
	<1296399153.2388.57.camel@localhost>
To: dedekind1@gmail.com
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30.01.2011 at 15:52, Artem Bityutskiy wrote:
> Hi,
>=20
> On Sun, 2011-01-30 at 10:31 +0100, Mathias Krause wrote:
>> diff --git a/drivers/mtd/devices/phram.c =
b/drivers/mtd/devices/phram.c
>> index 5239328..8d28fa0 100644
>> --- a/drivers/mtd/devices/phram.c
>> +++ b/drivers/mtd/devices/phram.c
>> @@ -117,6 +117,7 @@ static void unregister_devices(void)
>> 	list_for_each_entry_safe(this, safe, &phram_list, list) {
>> 		del_mtd_device(&this->mtd);
>> 		iounmap(this->mtd.priv);
>> +		kfree(this->mtd.name);
>> 		kfree(this);
>> 	}
>=20
> Since register_device() did not allocate it, unregister_devices() =
should
> not free it.

I agree with you, the internal API is a little quirky regarding that =
point. register_device() should strdup() the name and not just blindly =
use it. But since the memory for name was already allocated via =
kmalloc() in phram_setup() it seems a little nitpicky to copy it once =
again in register_device().

> Hence, I think it is better to free(name) just after
> calling unregister_devices().

This is not possible because unregister_devices() unregisters all =
devices, not just a single instance. Though name must be freed for every =
object in the list. After unregister_devices() returns the list is empty =
and no pointer to the memory locations do exist any more. So my patch =
was the straight forward fix for the memory leak.


Regards,
Mathias=
