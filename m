Received: from zose-mta12.web4all.fr ([178.33.204.89])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUZb0-0008C5-TI
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 08:28:38 +0000
Message-ID: <4FB36520.4070805@tribudubois.net>
Date: Wed, 16 May 2012 10:28:16 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [JFFS2] allow JFFS2 to discriminate between recoverable
 and non-recoverable errors
References: <1336662824-2594-1-git-send-email-jcd@tribudubois.net>
 <1336755933.2625.100.camel@sauron.fi.intel.com>
 <1337156368.24809.15.camel@sauron.fi.intel.com>
In-Reply-To: <1337156368.24809.15.camel@sauron.fi.intel.com>
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

On 16/05/2012 10:19, Artem Bityutskiy wrote:
> On Fri, 2012-05-11 at 20:05 +0300, Artem Bityutskiy wrote:
>> Pushed both to l2-mtd.git, thanks!
>>
>> Can you confirm that these 2 patches solve the issues you earlier
>> described on this mailing list?

Yes, it does allow JFFS2 to recover from all the attribute integrity 
problems I demonstrated in an earlier email [1].

JC

[1]: http://patchwork.ozlabs.org/patch/151881/

> Ping.
>
