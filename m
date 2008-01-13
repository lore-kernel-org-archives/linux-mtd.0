Received: from 216-237-3-220.orange.nextweb.net ([216.237.3.220]
	helo=OCEX01.SolarFlarecom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JE6Zv-0003FD-Mt
	for linux-mtd@lists.infradead.org; Sun, 13 Jan 2008 17:25:08 +0000
Message-ID: <478A4825.8000006@solarflare.com>
Date: Sun, 13 Jan 2008 17:19:33 +0000
From: David Riddoch <driddoch@solarflare.com>
MIME-Version: 1.0
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
	<20080111125000.GL3544@solarflare.com>
	<20080111132444.GA1399@lazybastard.org>
	<20080111185550.GN3544@solarflare.com>
In-Reply-To: <20080111185550.GN3544@solarflare.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Hutchings wrote:
>>>>   struct semaphore access_lock; should become a mutex.
>>>>         
>>> Right.  We've tended to be quite conservative in using newer kernel
>>> features, since we also need to support old kernels, but we have a
>>> good backward-compatibility layer now (unifdef'd out of the submitted
>>> code) so this shouldn't be a problem.
>>>       
>> Ok.  A straight conversion to a mutex will likely cause trouble with
>> your reset routine.  Not sure what to do here.
>>     
>
> We can use a mutex if the net driver is guaranteed to call
> reset_suspend() and reset_resume() in the same context.  This is
> currently true (they are always called in a pair by efx_reset() in
> efx.c) but I'm not sure we want to guarantee that.
>   
reset_suspend() is documented as being called in a context that permits 
sleeping, and I can't see us ever changing that.  reset_resume() will 
also continue to permit sleeping (although that isn't currently documented).

Cheers,
David

-- 
David Riddoch  +++  Solarflare  +++  driddoch@solarflare.com
