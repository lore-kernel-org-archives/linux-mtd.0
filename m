Received: from mail017.syd.optusnet.com.au ([210.49.20.175])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17K735-0003cE-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 01:40:43 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail017.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5I0edX17771
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 10:40:39 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17K730-0000tf-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 10:40:38 +1000
Message-ID: <3D0E8185.2080507@ctam.com.au>
Date: Tue, 18 Jun 2002 10:40:37 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000
References: <AIEOIMKIOAAJKHJOGAEFMEDLCEAA.david@forcedpotato.com>
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

Can you save it to another computer via NFS ?


David Cooper wrote:

>Thanks for the tip.
>
>I tried this but, of course, the screen goes blank, system hangs and I can
>never look at the xinit.log file.
>
>When I do a hard reboot, this file is gone.
>
>Cheers,
>
>David Cooper
>
>-----Original Message-----
>From: linux-mtd-admin@lists.infradead.org
>[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ilguiz Latypov
>Sent: Monday, June 17, 2002 6:32 PM
>To: David Cooper
>Cc: Linux MTD
>Subject: RE: X Windows Performance with DOC 2000
>
>
>
>Will this line log anything meaningful?
>
>   xinit > /tmp/xinit.log 2>&1
>
>Ilguiz
>
>On Mon, 17 Jun 2002, David Cooper wrote:
>
