Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoMBg-00010Z-Cx
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 17:21:48 +0000
Message-ID: <480E1EA8.9040101@gmx.net>
Date: Tue, 22 Apr 2008 19:21:44 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] [RESEND] MAPS: add support for Nvidia MCP55 to
	ck804xrom
References: <478E1880.2040609@gmx.net>
	<1208884343.9212.633.camel@pmac.infradead.org>
In-Reply-To: <1208884343.9212.633.camel@pmac.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22.04.2008 19:12, David Woodhouse wrote:
> On Wed, 2008-01-16 at 15:45 +0100, Carl-Daniel Hailfinger wrote:
>   
>> [PATCH] [MTD] MAPS: add support for Nvidia MCP55 to ck804xrom
>>
>> This patch extends the existing MAPS driver for the Nvidia CK804 chipset
>> (ck804xrom.c) to also work on the Nvidia MCP55 chipset. As both chipsets
>> are rather similar, suporting them both with the same driver is easy.
>>
>> The patch is not ready for inclusion yet, it needs some codingstyle care
>> and probably better comments. The indenting is wrong at some points to
>> keep the diff minimal for a first review. I will post a better version
>> once I get some comments.
>>     
>
> I fixed that and applied it anyway.
>   

Thank you!

>> +	{ PCI_VENDOR_ID_NVIDIA, 0x0363,
>> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
>> +	{ PCI_VENDOR_ID_NVIDIA, 0x0364,
>> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
>> +	{ PCI_VENDOR_ID_NVIDIA, 0x0365,
>> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
>> +	{ PCI_VENDOR_ID_NVIDIA, 0x0366,
>> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
>> +	{ PCI_VENDOR_ID_NVIDIA, 0x03607,
>> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
>>     
>
> I fixed that too; I assume the last ID should have been 0x367?
>   

Indeed, my bad.

Regards,
Carl-Daniel
