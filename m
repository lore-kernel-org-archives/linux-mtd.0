Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwylK-0005Yf-Bc
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 17:00:39 +0000
Message-ID: <501AB2C8.9010805@am.sony.com>
Date: Thu, 2 Aug 2012 10:03:04 -0700
From: Tim Bird <tim.bird@am.sony.com>
MIME-Version: 1.0
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: Re: UBI fastmap updates
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
 <1343917741.25013.114.camel@sauron.fi.intel.com>
 <20120802165132.1bf1e5d7@spider.haslach.nod.at>
 <1343924267.25013.156.camel@sauron.fi.intel.com>
 <20120802183210.7076aa48@spider.haslach.nod.at>
 <1343925930.25013.163.camel@sauron.fi.intel.com>
In-Reply-To: <1343925930.25013.163.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: "nyoushchenko@mvista.com" <nyoushchenko@mvista.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "Heinz.Egger@linutronix.de" <Heinz.Egger@linutronix.de>,
 "thomas.wucher@linutronix.de" <thomas.wucher@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shmulik.ladkani@gmail.com" <shmulik.ladkani@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "Marius.Mazarel@ugal.ro" <Marius.Mazarel@ugal.ro>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/02/2012 09:45 AM, Artem Bityutskiy wrote:
> Richard,
> 
> On Thu, 2012-08-02 at 18:32 +0200, Richard Weinberger wrote:
>>> This should not happen. Fastmap should _reserve_ enough of PEBs for it
>>> to operate. It should always find the PEB to write.
>>
>> What is the benefit?
>> IOW what is wrong with the current approach?
> 
> Several reasons. The main is: fastmap will start consuming PEBs reserved
> for volumes when the amount of available PEBs is just enough to map all
> LEBs. This will break UBI liability.

I'm don't understand what "UBI liability" is.  Can you please clarify?
What breaks if the PEBs get consumed?

> 
>> Why?
>> If everything goes wrong, fastmap makes sure that no fastmap is on
>> flash.
>> In case of a powercut we fall back to scanning mode.
>> R/O mode is overkill IMHO.
> 
> So can I interpret this the following way. Not only fastmap give no
> guarantees that it exists after an unclean reboot, it does not even give
> guarantees that it exists after a clean reboot.
> 
> Unless I am confused, the fastmap design is over-simplified.

Fastmap is an optimization.  Maybe I'm missing something, but
I'm not sure why, if the optimization stopped working, you
would want to reduce the functionality of the file system.

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
