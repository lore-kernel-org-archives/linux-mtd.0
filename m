Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jmAx-0002b5-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 20:38:55 +0100
Message-ID: <3D6BD539.4050101@goepel.com>
Date: Tue, 27 Aug 2002 21:38:33 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: flash file system for production use
References: <3D6BCCFD.4090707@goepel.com> <27451.1030476296@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

okay... thanks for the answer.
i will do some serious testing myself. what would be a real life 
scenario ??? is a random loop with creating, writing and deleting files 
mixed with mounting and unmounting and some random powerfaults???

i think the salesdroids- thing will not work: they only thing they want 
is to get a product to the market as fast as they can...

David Woodhouse schrieb:

>m.palme@goepel.com said:
>  
>
>> i need a  mechanism for storing configuration files etc in the
>>flashes. for this  purpose 20mb of the flashes are free. the
>>performance/ stability thing  is very important for me. i cant wait 10
>>secs fot mounting/ checking  etc. i' ve tried jffs2 from CVS and it
>>seems to be "fast" on a nearly  empty flash partition, but i have no
>>suggestion about what happens in  hard production use, when the flash
>>will be written  over and over again  and the wear leveling takes
>>place. the device is never shutdown'ed in a  clean way -- always hard
>>power off... 
>>    
>>
>
>JFFS2 from CVS should be fine. It hasn't had as much hard testing as the
>stable branch, but I have no particular reason to expect it to be broken on
>NOR flash. I wouldn't ship it to a customer before doing some serious
>retesting, but you can do that yourself and report anything you find -- I
>don't expect anything to break.
>
>There are other things we can do to improve performance and mount time even
>more than we've already done in CVS. They're listed in the TODO file, and if
>you're likely to actually implement them I'm happy to give more explicit
>pointers -- or I can set our salesdroids on you if that would be useful :)
>
>--
>dwmw2
>
>  
>
