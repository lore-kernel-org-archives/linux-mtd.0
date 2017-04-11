Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cy36j-0000zT-S7
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 21:13:51 +0000
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
To: Christoph Hellwig <hch@infradead.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
 <20170411160530.GA25234@infradead.org>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
Date: Tue, 11 Apr 2017 23:13:24 +0200
MIME-Version: 1.0
In-Reply-To: <20170411160530.GA25234@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.04.2017 um 18:05 schrieb Christoph Hellwig:
> On Tue, Apr 11, 2017 at 11:50:54AM +0200, Oleksij Rempel wrote:
>> increment i_version to notify security/IMA about changes
>> made in inode.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> And how is this stored on disk?
> 

Hehe, I was about to ask the same question. :-)

Thanks,
//richard
