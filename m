Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TwBD4-00038O-RC
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 12:38:15 +0000
Message-ID: <50F9422D.6020500@gmail.com>
Date: Fri, 18 Jan 2013 13:38:05 +0100
From: Stefan Roese <stefan.roese@gmail.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
References: <1358511005-23258-1-git-send-email-sr@denx.de>
 <50F94122.3000609@gmail.com>
In-Reply-To: <50F94122.3000609@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/18/2013 01:33 PM, Vikram Narayanan wrote:
> On 1/18/2013 5:40 PM, Stefan Roese wrote:
> <snip>
>> nor_flash@0,0 {
>> 	compatible = "amd,s29gl256n", "cfi-flash";
>> 	bank-width = <2>;
>> 	use-advanced-sector-protection;
>> 	...
>>
>> Tested with Spanion S29GL512S10THI and Micron JS28F512M29EWx flash
>> devices.
> 
> Minor nitpick.
> Isn't it Spansion?

Yes, of course. Artem, should I send a new patch version for this
spelling error?

Thanks,
Stefan
