Received: from mail-pb0-f45.google.com ([209.85.160.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TwB8p-0002Pc-RD
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 12:33:52 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc8so2018925pbc.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2013 04:33:49 -0800 (PST)
Message-ID: <50F94122.3000609@gmail.com>
Date: Fri, 18 Jan 2013 18:03:38 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
References: <1358511005-23258-1-git-send-email-sr@denx.de>
In-Reply-To: <1358511005-23258-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/18/2013 5:40 PM, Stefan Roese wrote:
<snip>
> nor_flash@0,0 {
> 	compatible = "amd,s29gl256n", "cfi-flash";
> 	bank-width = <2>;
> 	use-advanced-sector-protection;
> 	...
>
> Tested with Spanion S29GL512S10THI and Micron JS28F512M29EWx flash
> devices.

Minor nitpick.
Isn't it Spansion?

~Vikram
