Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjpSQ-0001W1-PD
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 11:31:20 +0000
Received: by mail-we0-f170.google.com with SMTP id w57so84076wes.29
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2013 04:30:51 -0700 (PDT)
Sender: Christian Riesch <christian.riesch@gmail.com>
Message-ID: <51ADCFEA.3060605@omicron.at>
Date: Tue, 04 Jun 2013 13:30:50 +0200
From: Christian Riesch <christian.riesch@omicron.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 1/4] mtd: cfi_cmdset_0002: Add support for reading OTP
References: <1367003430-24584-1-git-send-email-christian.riesch@omicron.at>
 <38c84e40-1171-4040-bc8b-ec51a0485819@mary.at.omicron.at>
 <1369811482.5446.216.camel@sauron.fi.intel.com> <51A5FA84.8030906@omicron.at>
 <1369835589.24286.31.camel@sauron.fi.intel.com> <51A61274.70607@omicron.at>
 <1370252414.21714.29.camel@sauron.fi.intel.com>
In-Reply-To: <1370252414.21714.29.camel@sauron.fi.intel.com>
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

On 2013-06-03 11:40, Artem Bityutskiy wrote:
> On Wed, 2013-05-29 at 16:36 +0200, Christian Riesch wrote:
>>> But retlen is where you return the amount of bytes you actually
>> wrote.
>>> The return code is either 0 or a negative error code number. This is
>>> what we do in mtd_write() and I'd expect the OTP functions to be
>>> consistent.
>>
>> Unlike mtd_write, mtd->_get_fact_prot_info (which is a pointer to
>> cfi_amdstd_get_fact_prot_info here) does not have a retlen parameter.
>> Do
>> you suggest to change this?
>
> Yes, I would suggest this.
>

Ok, I will prepare a patch for this.
Thanks, Christian
