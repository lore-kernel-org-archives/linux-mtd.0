Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm35m-0005qC-QB
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 16:05:55 +0000
Message-ID: <545A4ACA.2070402@nod.at>
Date: Wed, 05 Nov 2014 17:05:30 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 03/35] UBI: Fastmap: Add self check to detect absent PEBs
References: <1414586758-9972-1-git-send-email-richard@nod.at>		
 <1414586758-9972-4-git-send-email-richard@nod.at>	
 <1415201029.958.118.camel@sauron.fi.intel.com> <545A48BD.9010904@nod.at>
 <1415203295.958.133.camel@sauron.fi.intel.com>
In-Reply-To: <1415203295.958.133.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.11.2014 um 17:01 schrieb Artem Bityutskiy:
> On Wed, 2014-11-05 at 16:56 +0100, Richard Weinberger wrote:
>>  I did that to have alloc and free balanced.
>> I.e. to not have a naked kfree(). Always when I see a kfree()
>> somewhere
>> I'd like to see the k*alloc().
> 
> OK. Please, just make the comment simpler then. Say that you are freeing
> the debugging buffer or something.

Will do!

Thanks,
//richard
