Received: from nbd.name ([46.4.11.11])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5y1r-000438-7B
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 11:30:37 +0000
Message-ID: <4F59E99D.7090409@openwrt.org>
Date: Fri, 09 Mar 2012 12:29:33 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V2 1/3] MTD: MIPS: lantiq: use module_platform_driver
 inside lantiq map driver
References: <1330013024-13622-1-git-send-email-blogic@openwrt.org>
 <1331292517.29445.6.camel@sauron.fi.intel.com>
In-Reply-To: <1331292517.29445.6.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/03/12 12:28, Artem Bityutskiy wrote:
> On Thu, 2012-02-23 at 17:03 +0100, John Crispin wrote:
>> Reduce boilerplate code by converting driver to module_platform_driver.
>>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Cc: linux-mtd@lists.infradead.org
> This is not an independent patch - do you want to merge it via the mips
> tree?
>
via MIPS, sorry for not putting the info in the commit text
