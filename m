Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RmlfK-0003Jh-5q
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:27:59 +0000
Message-ID: <4F141802.5080904@ftemaximal.fr>
Date: Mon, 16 Jan 2012 13:28:50 +0100
From: Alexandre Gambier <a.gambier@ftemaximal.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
 <1326554080.14299.2.camel@sauron.fi.intel.com>
 <4F13E424.7070104@ftemaximal.fr>
 <1326716672.14299.70.camel@sauron.fi.intel.com>
In-Reply-To: <1326716672.14299.70.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 01/16/2012 01:24 PM, Artem Bityutskiy wrote:
> On Mon, 2012-01-16 at 09:47 +0100, Alexandre Gambier wrote:
>> For example, for my 128MiB partition I specified 120MiB which is 7%
>> smaller than the total size.
> You should be able to find the UBI overhead formulas on the MTD web
> site. Try to specify less than that and see. You should leave enough
> PEBs reserved for bad eraseblocks handling - it is 1% by default.
>
>> What size would you specify for a 128MiB partition ?
>> thanks for your help.
> I do not have time to calculate and I do not remember. But the easiest
> is to use something small enough and put the auto-resize flag - it will
> then make it to be the maximum size. E.g., use 100MiB, boot and see to
> how much it resized.

I already use the auto-resize flag...I will try to specify a smaller 
size and see if it fixes this warning.

>
