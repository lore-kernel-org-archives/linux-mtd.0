Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PvbLs-0004Jw-IN
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2011 20:11:53 +0000
Message-ID: <4D7147CC.1020009@openwrt.org>
Date: Fri, 04 Mar 2011 21:13:00 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH V3 06/10] MIPS: lantiq: add NOR flash support
References: <1299146626-17428-1-git-send-email-blogic@openwrt.org>
	<1299146626-17428-7-git-send-email-blogic@openwrt.org>
	<4D70DDEA.2050308@mvista.com>
In-Reply-To: <4D70DDEA.2050308@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>> +    if (ltq_mtd_probing)
>> +        adr ^= 2;
>> +    spin_lock_irqsave(&ebu_lock, flags);
>> +    temp.x[0] = *((__u16 *)(map->virt + adr));
>> +    spin_unlock_irqrestore(&ebu_lock, flags);
>
>    Hm, what does this lock gain, if the read is atomic anyway?

the SoC has a hardware arbitor for the EBU. I have so far not been able
to activate it properly and the lock is needed to protect from PCI and
NOR i/o clashing with eachother. i know that the arbitor works when
using lantiqs 2.6.28. i will provide a follow up patch once i figured
how to bring up the arbitor properly. until that time we need to use the
lock.

thanks,
John
