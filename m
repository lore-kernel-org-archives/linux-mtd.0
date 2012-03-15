Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S81TN-0005Ba-2A
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 03:35:29 +0000
Message-ID: <4F61634D.5010801@st.com>
Date: Thu, 15 Mar 2012 09:04:37 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH v2 01/13] nand/fsmc: Pass partition information through
 platform data
References: <cover.1331705527.git.vipin.kumar@st.com>
 <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
 <1331727138.3730.2.camel@sauron.fi.intel.com>
In-Reply-To: <1331727138.3730.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "sr@denx.de" <sr@denx.de>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/14/2012 5:42 PM, Artem Bityutskiy wrote:
> On Wed, 2012-03-14 at 11:47 +0530, Vipin Kumar wrote:
>> +	ret = mtd_device_parse_register(&host->mtd, NULL, 0, host->partitions,
>> +			host->nr_partitions);
>
> This causes a GCC warning about passing plain 0 as NULL. But I'll amend
> the patch myself and fix this.
>

Thanks Artem
