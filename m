Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwksZ-00070n-TX
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 02:11:12 +0000
Message-ID: <5019E1AE.4030806@grid-net.com>
Date: Wed, 1 Aug 2012 19:10:54 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS corruption after software upgrade
References: <500F0D81.8050902@cincinnatitechnologies.com>
 <501923A9.7030002@cincinnatitechnologies.com>
In-Reply-To: <501923A9.7030002@cincinnatitechnologies.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2012 05:40 AM, Russell Zuck wrote:
> On 7/24/2012 5:02 PM, Russell Zuck wrote:
>> I have not yet attempted to reproduce this issue using nandsim nor do I
>> have a simple reproducer for the problem yet.  Please provide some ideas
>> about how to simulate the reboot using nandsim as I think the reboot
>> portion of this scenario will be critical to reproducing the issue.
>
> Can anyone direct me to some information that might help me simulate a 
> reboot using nandsim to attempt to reproduce my UBIFS corruption issue?
>
> Additionally, I would really appreciate any suggestions, tips, tricks, 
> criticisms of the upgrade process I outlined previously, or "Have you 
> considered this" type questions.  I've read everything I could find 
> that even remotely pertains to my scenario but nothing is clicking for 
> me yet.  I'm desperately trying to resolve my issue.  Any guidance 
> would be welcome.

Some of the things I have done/considered to minimize issues  with UBIFS 
getting corrupted.

. Partition your UBIFS such that your run-time software ('os') is on one 
UBIFS and that is always mounted read-only.
. Create independent UBIFS (data) partition where your applications 
read/write data. If you can't mount this data partition at startup, have 
tools around in first partition that can recreate this 'data' partition 
and may be recreate contents of 'data' partition with default values. 
Might consider mounting this data partition with -o sync option.
. Use stuff like inotify to verify that your applications are not using 
flash as scratch storage to store intermediate data, that could be more 
easily assembled in tmpfs and then copied to flash.


-Subodh
