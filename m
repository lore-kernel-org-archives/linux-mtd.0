Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSA4l-0001kI-TR
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 16:49:29 +0000
Message-ID: <4FAAA007.903@newsguy.com>
Date: Wed, 09 May 2012 09:49:11 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on
 reads
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
 <1336210990.2027.2.camel@koala>
In-Reply-To: <1336210990.2027.2.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1
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

On 05/05/2012 02:43 AM, Artem Bityutskiy wrote:
> On Wed, 2012-04-25 at 12:06 -0700, Mike Dunn wrote:
>> This v2 of this set includes the following changes:
>>   - [Patch 4/7]: Propagate bitflip_threshold from master to slave partition.
>>   - [Patch 5/7]: Zero out max_bitflips outside of if-block in fsl_ifc_nand.
>>   - [Patch 6/7]: Simplify ecc strength sanity check.
> 
> Would you please do one more thing - create a piece of documentation
> about this feature at the mtd web site.


Do you have any suggestions regarding where on the site this should be added?

Thanks,
Mike
