Message-ID: <4EEE9A44.6080401@atmel.com>
Date: Mon, 19 Dec 2011 09:58:28 +0800
From: Hong Xu <hong.xu@atmel.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: atmel_nand: Update Kconfig to support PMECC
References: <1323327219-17895-1-git-send-email-hong.xu@atmel.com>
 <1323723514.2297.8.camel@koala> <4EE6A6DF.4@atmel.com>
 <4EE6B160.3000201@atmel.com> <1324136016.4240.48.camel@sauron.fi.intel.com>
In-Reply-To: <1324136016.4240.48.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: hong.xu@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/17/2011 11:33 PM, Artem Bityutskiy wrote:
> On Tue, 2011-12-13 at 09:58 +0800, Hong Xu wrote:
>> PMECC is not compatible with the old HW ECC engine. It currently needs
>> around 700 lines of C code to make it work. If we do not have a way to
>> exclude the PMECC related code at compiling time, my quick testing shows
>> that the driver code size will be doubled if some old SoCs do not
>> support it. This sounds not good. What's your opinion?
>
> Well, depends on its size. Say, if it is about 8KiB - then doubling it
> is probably not a big deal.
>

Hmm.., not that big, less than 8KB. OK, I'll send out another patch 
removing the stuff modified in Kconfig.

Thanks!

BR,
Eric
