Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmi6b-0004H4-FP
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 11:53:30 +0000
Message-ID: <545CB2A0.8050504@nod.at>
Date: Fri, 07 Nov 2014 12:53:04 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Fix double free after do_sync_erase()
References: <1415288869-14915-1-git-send-email-richard@nod.at>
 <1415361043.958.326.camel@sauron.fi.intel.com>
In-Reply-To: <1415361043.958.326.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.11.2014 um 12:50 schrieb Artem Bityutskiy:
> On Thu, 2014-11-06 at 16:47 +0100, Richard Weinberger wrote:
>> If the erase worker is unable to erase a PEB it will
>> free the ubi_wl_entry itself.
>> The failing ubi_wl_entry must not free()'d again after
>> do_sync_erase() returns.
>>
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Pushed, thanks!

BTW: Please don't forget "[PATCH] UBI: Fix invalid vfree()".

Thanks,
//richard
