Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RmiDF-0006C9-8D
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 08:46:46 +0000
Message-ID: <4F13E424.7070104@ftemaximal.fr>
Date: Mon, 16 Jan 2012 09:47:32 +0100
From: Alexandre Gambier <a.gambier@ftemaximal.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
 <1326554080.14299.2.camel@sauron.fi.intel.com>
In-Reply-To: <1326554080.14299.2.camel@sauron.fi.intel.com>
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


On 01/14/2012 04:14 PM, Artem Bityutskiy wrote:
> On Wed, 2012-01-11 at 09:10 +0100, Alexandre Gambier wrote:
>>>> hi everyone,
>>>>
>>>> I use UBI volume and UBIFS on top of a NAND device with an embedded
>>>> video meter.
>>>> Everything works fine except that when a UBI volume is mounted the
>>>> following warning is outputted :
>>>> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
>>>> handling, reserved 0, need 20"
>>> Looks like the pool of reserved PEBs is fully used. Fo how long have you
>>> been using this flash?
>> This is a brand new flash...I've been using it for 2 months.
> OK, in this case this is most probably because you specified too large
> sizes in your ubinize.cfg. So that your volumes take all eraseblocks.
> Try to make some volumes smaller.

For example, for my 128MiB partition I specified 120MiB which is 7% 
smaller than the total size.
What size would you specify for a 128MiB partition ?
thanks for your help.
