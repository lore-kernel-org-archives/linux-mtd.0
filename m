Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un25Q-0004IG-Mc
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 07:36:49 +0000
Message-ID: <51B977C1.4090200@intel.com>
Date: Thu, 13 Jun 2013 10:41:53 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Subject: Re: UBIFS failure & stable page writes
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DD7F@SI-MBX14.de.bosch.com>
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DD7F@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/05/13 16:00, Prins Anton (ST-CO/ENG1.1) wrote:
> Could there be a relation between the issue and the following commits (freeing of orphans/cnext=NULL)?:
>
> http://git.infradead.org/ubifs-2.6.git/commit/8afd500cb52a5d00bab4525dd5a560d199f979b9
> http://git.infradead.org/ubifs-2.6.git/commit/2928f0d0c5ebd6c9605c0d98207a44376387c298

Yes you do have the problem that these patches fix.  Please try them.

>
>
> Met vriendelijke groeten | Best Regards, 
> Anton Prins
>
> Bosch Security Systems BV, 
> Conference Systems (ST-CO/ENG1.1) 
> Torenallee 49
> 5617 BA  Eindhoven
> The Netherlands 
> www.boschsecurity.com 
> T. +31 (0)40 2577077
> anton.prins@nl.bosch.com
>
>
> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com] 
> Sent: dinsdag 28 mei 2013 11:11
> To: Prins Anton (ST-CO/ENG1.1)
> Cc: Jan Kara; Adrian Hunter; linux-mtd@lists.infradead.org
> Subject: Re: UBIFS failure & stable page writes
>
> On Tue, 2013-05-28 at 10:18 +0200, Prins Anton (ST-CO/ENG1.1) wrote:
>> Creation is of the problem is not that easy, but once you boot and this happens it is reproducible every boot.
>> Even if I copy the image (nanddump) to another device the failure moves with the image.
> Well, the latter is less interesting.
>
