Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6Ek-0000bC-0Q
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:09:14 +0000
Received: by ewy20 with SMTP id 20so1796573ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:09:12 -0800 (PST)
Subject: Re: [PATCH] mtd: fix memory leak
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mathias Krause <minipli@googlemail.com>
In-Reply-To: <168EA60D-68D1-4281-A0C2-22B2B598AFE1@googlemail.com>
References: <1296379908-10150-1-git-send-email-minipli@googlemail.com>
	<1296399153.2388.57.camel@localhost>
	<168EA60D-68D1-4281-A0C2-22B2B598AFE1@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:08:19 +0200
Message-ID: <1297004899.4460.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-01-30 at 18:35 +0100, Mathias Krause wrote:
> On 30.01.2011 at 15:52, Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Sun, 2011-01-30 at 10:31 +0100, Mathias Krause wrote:
> >> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> >> index 5239328..8d28fa0 100644
> >> --- a/drivers/mtd/devices/phram.c
> >> +++ b/drivers/mtd/devices/phram.c
> >> @@ -117,6 +117,7 @@ static void unregister_devices(void)
> >> 	list_for_each_entry_safe(this, safe, &phram_list, list) {
> >> 		del_mtd_device(&this->mtd);
> >> 		iounmap(this->mtd.priv);
> >> +		kfree(this->mtd.name);
> >> 		kfree(this);
> >> 	}
> > 
> > Since register_device() did not allocate it, unregister_devices() should
> > not free it.
> 
> I agree with you, the internal API is a little quirky regarding that point. register_device() should strdup() the name and not just blindly use it. But since the memory for name was already allocated via kmalloc() in phram_setup() it seems a little nitpicky to copy it once again in register_device().
> 
> > Hence, I think it is better to free(name) just after
> > calling unregister_devices().
> 
> This is not possible because unregister_devices() unregisters all devices, not just a single instance. Though name must be freed for every object in the list. After unregister_devices() returns the list is empty and no pointer to the memory locations do exist any more. So my patch was the straight forward fix for the memory leak.

OK, I agree, I think this patch is good enough, pushed to l2-mtd-2.6.git
tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
