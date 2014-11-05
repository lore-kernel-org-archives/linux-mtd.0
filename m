Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2zg-0008TX-2P
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:59:36 +0000
Message-ID: <545A4947.4030403@nod.at>
Date: Wed, 05 Nov 2014 16:59:03 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 06/35] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1414586758-9972-1-git-send-email-richard@nod.at>		
 <1414586758-9972-7-git-send-email-richard@nod.at>	
 <1415202307.958.125.camel@sauron.fi.intel.com> <545A46F0.7030805@nod.at>
 <1415202877.958.131.camel@sauron.fi.intel.com>
In-Reply-To: <1415202877.958.131.camel@sauron.fi.intel.com>
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

Am 05.11.2014 um 16:54 schrieb Artem Bityutskiy:
> On Wed, 2014-11-05 at 16:49 +0100, Richard Weinberger wrote:
>> If you want I can rebase.
> 
> That would be very helpful.
> 
>> I did all fixes first and then the cleanups.
> 
> Well, the first patch adds debugging stuff - not exactly a fix ;-)

Let's name it robustness stuff. ;)
Seriously, I did first all fixes and the code cleanups later to make
it easy for others to backport these fixes.

Thanks,
//richard
