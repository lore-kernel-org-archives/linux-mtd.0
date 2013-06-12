Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UmkjA-0006QV-JR
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 13:04:41 +0000
Message-ID: <51B87315.7090808@intel.com>
Date: Wed, 12 Jun 2013 16:09:41 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Subject: Re: UBIFS failure & stable page writes
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
 <51B82A1D.30009@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3508@SI-MBX14.de.bosch.com>
 <51B862D6.2080807@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
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

Can you tar and send fs/ubifs directory?

On 12/06/13 14:57, Prins Anton (ST-CO/ENG1.1) wrote:
> Ok clear!
>
> Regarding mount debug: I suppose I only will see this on the 'first' boot after the problem is in the persistence storage?
> (Up to now I'm not able to signal the point-of-failure... I'm only looking to an (possibly) after recovery situation).
>
> Or makes this sense to do this mount debug on the existing failing device?
>
> FYI: 
> - with 100 devices power cycling every 5 minutes for a weekend we DON'T see a problem.
> - with 100 devices powered on for a weekend and after that give a single power-cycle shows maybe 1 or 2 failing devices (but sometimes '0').
>
> So a main problem in analyzing is the 'moment of failure' and 'reproduction (rate)'.
>
> Met vriendelijke groeten | Best Regards, 
> Anton Prins
>
> Met vriendelijke groeten | Best Regards, 
> Anton Prins
>
>
> -----Original Message-----
> From: Adrian Hunter [mailto:adrian.hunter@intel.com] 
> Sent: woensdag 12 juni 2013 14:00
> To: Prins Anton (ST-CO/ENG1.1)
> Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org
> Subject: Re: UBIFS failure & stable page writes
>
> On 12/06/13 14:13, Prins Anton (ST-CO/ENG1.1) wrote:
>> Does it make sense to use chk_orphans?
> That checks for missing orphans but the problem is the opposite: the
> presence of orphans that should not be there.
>
>> I suppose I have to do: $ echo "1" > chk_orphans
>>
>> Or am I wrong?
>>
>> Met vriendelijke groeten | Best Regards, 
>> Anton Prins
>>
