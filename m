Received: from [62.79.30.252] (helo=dmz4.rosetechnology.dk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlLrb-00008Q-7G
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 04:15:45 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by dmz4.rosetechnology.dk (Postfix) with ESMTP id 0A9F59BE45
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 May 2006 10:20:15 +0200 (CEST)
Received: from dmz4.rosetechnology.dk ([127.0.0.1])
	by localhost (dmz4.rosetechnology.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 17848-05 for <linux-mtd@lists.infradead.org>;
	Wed, 31 May 2006 10:20:05 +0200 (CEST)
Received: from [192.168.36.139] (unknown [192.168.1.101])
	by dmz4.rosetechnology.dk (Postfix) with ESMTP id 3A5139BDEC
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 May 2006 10:20:05 +0200 (CEST)
Message-ID: <447D5002.6030201@rosetechnology.dk>
Date: Wed, 31 May 2006 10:12:50 +0200
From: Henrik Bork Steffensen <hbs@rosetechnology.dk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <447C5226.5030800@rosetechnology.dk>
	<Pine.LNX.4.64.0605301511150.16927@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0605301511150.16927@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Unlocked flash is re-locked by unknow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:

>A spike on the flash power maybe?
>  
>
Yes, that's it!

The 2.6 seems to generate 20-40% larger spikes on Vcc than
the old 2.4.19-rmk7, which runs 30 Bogomips were the 2.6
runs at 90 Bogomips. (i have no idea of this is just the
bogomips loop which runs faster or the cpu actually runs
faster)

Thanks you very much - we obviously needed fresh eyes on
the subject.


-- 
med venlig hilsen / best regards / Mit freundlichen Grüßen

Henrik Bork Steffensen

RoseTechnology A/S
http://www.rosetechnology.dk
