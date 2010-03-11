Message-ID: <4B991B9B.8070809@oracle.com>
Date: Thu, 11 Mar 2010 08:34:35 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] mtd/nand/r852: fix build for CONFIG_PM=n
References: <20100301210210.c6f465e6.sfr@canb.auug.org.au>	
	<4B8C378B.2090400@oracle.com>
	<1267531329.10734.1.camel@maxim-laptop>
	<4B991A6F.1080006@oracle.com>
In-Reply-To: <4B991A6F.1080006@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/11/10 08:29, Randy Dunlap wrote:
> On 03/02/10 04:02, Maxim Levitsky wrote:
>> On Mon, 2010-03-01 at 13:54 -0800, Randy Dunlap wrote: 
>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>
>>> Fix r852 build for the case of CONFIG_PM=n.
>>>
>>> drivers/mtd/nand/r852.c:1039: error: implicit declaration of function 'pci_prepare_to_sleep'
>>> drivers/mtd/nand/r852.c:1048: error: implicit declaration of function 'pci_back_from_sleep'
>>>
>>> This patch leaves r852_pm_ops untouched.
>>>
>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>>> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
>>> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> ---
>>>  drivers/mtd/nand/r852.c |    5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> --- linux-next-20100301.orig/drivers/mtd/nand/r852.c
>>> +++ linux-next-20100301/drivers/mtd/nand/r852.c
>>> @@ -1007,6 +1007,7 @@ void r852_shutdown(struct pci_dev *pci_d
>>>  	pci_disable_device(pci_dev);
>>>  }
>>>  
>>> +#ifdef CONFIG_PM
>>>  int r852_suspend(struct device *device)
>>>  {
>>>  	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
>>> @@ -1081,6 +1082,10 @@ int r852_resume(struct device *device)
>>>  	r852_update_card_detect(dev);
>>>  	return 0;
>>>  }
>>> +#else
>>> +#define r852_suspend	NULL
>>> +#define r852_resume	NULL
>>> +#endif
>>>  
>>>  static const struct pci_device_id r852_pci_id_tbl[] = {
>>>  
>>>
>> oops, I forgot about that case again..
>> Acked-by: Maxim Levitsky <maximlevitsky@gmail.com>
> 
> Ping.  can we get this added to linux-next, please?

Sorry, it's there, but there are still build errors.
I will look at those...

-- 
~Randy
