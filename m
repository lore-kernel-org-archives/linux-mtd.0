Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cemux-00072S-K8
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 23:07:10 -0500
Message-ID: <004801c4e325$01260320$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: "Craig Hollabaugh" <craig@hollabaugh.com>, <linux-mtd@lists.infradead.org>
References: <00cf01c4e29d$0b173670$8500a8c0@nit37>
	<20041215222528.GA7880@boa.ouraynet.com>
Date: Thu, 16 Dec 2004 09:39:03 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Flash programming
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Craig,

Thank you, actually our target comprises of an intel processor(iop80321), a 
flash(Intel NOR) and a ram, two usb ports and a ieee1394 port. In the flash 
there are drivers for existing system to work, my present requirement is to 
store a certain key/data/string in the flash, which shall be dynamically be 
modifiable by an user interface provided to the host, when connected to the 
target either through usb/firewire ports.

Firstly, I have looked into mtd drivers to store data (which basically is a 
key, a group of characters) in the flash, but I am not clear whether this 
will work or I have to look into jffs2 file system also, basically my path 
is not clear whether I have to use mtd/jffs2.

I will be thankful if you can suggest an approach, for storing the key
(group of characters).

Thanks,
Subrahmanyam.


----- Original Message ----- 
From: "Craig Hollabaugh" <craig@hollabaugh.com>
To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
Sent: Thursday, December 16, 2004 03:55 AM
Subject: Re: Flash programming


> On Wed, Dec 15, 2004 at 05:25:49PM +0530, Subrahmanyam wrote:
>> Can you please help me write into the flash, my present requirement is to
>> store a certain key/data/string in the flash, which shall be dynamically 
>> be
>> modifiable by an user interface provided to the host, when connected to 
>> the
>> target either through usb/firewire ports.
>
> which processor, which board, what kind of flash?
> 
