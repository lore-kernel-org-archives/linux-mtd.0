Received: from msr8.hinet.net ([168.95.4.108] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kKqO-0005gc-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 09:40:02 +0100
Message-ID: <3D6DDDC9.2080106@ms11.hinet.net>
Date: Thu, 29 Aug 2002 16:39:37 +0800
From: Steve Tsai <startec@ms11.hinet.net>
MIME-Version: 1.0
To: Paul <eepaul@cnuninet.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: I need some help about nand flash.
References: <000501c24f26$2d8cf800$09090d0a@paul2k>
Content-Type: text/plain; charset=gb2312
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

I do not know your condition very well, but I think all the pins of the
flash you connect correctly. What's the WE and RE timimg diagram in your
board? In my board, I use CS to control WE and RE and I have not enought
WE pull-high hold time, when two continue writeb functions are called in
nand_command. I delay few nsec between writeb funciotns to solve my
problem. You can try this and if you can provide more information about
your system, maybe I can give you more sugestion.

Steve Tsai

>Hi:
>    I have read your post http://lists.infradead.org/pipermail/linux-mtd/2002-June/005286.html.
>    
>    Now I encounter the same problem as you. 
>    The flash I used is TC58128AFTI manufacted by Toshiba.
>    I can read Device ID,read Status and Reset it successfully,but I can't read data.
>    I captured the timing diagram with a logic analyzer .It meets all requirements stated in 
>the chip's datasheet. 
>    When I perform a read operation(the command code is 0x00),the RY/BY# keeps high when the third address has been latched and that the data I read is always 0x00.
>   
>   
>   Any advice will be apreciated.
>
>   Thank you very much.
>
>
>
>  
>
