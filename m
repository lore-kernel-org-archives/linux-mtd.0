Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75wV-00040r-KU
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:05:12 +0000
Message-ID: <4D9B13E0.9000202@openwrt.org>
Date: Tue, 05 Apr 2011 15:06:40 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V7] MIPS: lantiq: add NOR flash support
References: <1302006830-10345-1-git-send-email-blogic@openwrt.org>
	<1302006995.2760.120.camel@localhost>
	<4D9B11C5.3030308@openwrt.org>
	<1302008284.2760.129.camel@localhost>
In-Reply-To: <1302008284.2760.129.camel@localhost>
Content-Type: text/plain; charset=UTF-8
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

On 05/04/11 14:58, Artem Bityutskiy wrote:
> On Tue, 2011-04-05 at 14:57 +0200, John Crispin wrote:
>   
>> we could dynamically allocate the instance of struct map_info and then
>> use map_priv_1 to indicate whether the device is probing or not.
>>     
> Yeah, may be you could indeed use map_priv_1 instead of the global
> variable already now? 
>
>   
Hi,

ok, let me add it to the patch ...

thanks, John
