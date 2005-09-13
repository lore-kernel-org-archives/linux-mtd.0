Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EF92o-0005SK-PJ
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 07:33:52 -0400
Message-ID: <4326B8FA.5030608@yandex.ru>
Date: Tue, 13 Sep 2005 15:33:14 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <43258B3B.7060405@intefo.ch> <4326B6F4.1030709@inf.u-szeged.hu>
In-Reply-To: <4326B6F4.1030709@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bugreport: JFFS2 + EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> And finaly it may also be more informative to set the JFFS2 debug level 
> 1 to get more debug message (the summary debug messages is the most 
> important for us)
I wonder, why don't you do the same trick that I did for fragtree build 
messages and the like, (see debug.h) to be able on/off your summary 
messages independently. Believe me, this is very handy to have a 
possibility to filter unneeded flood.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
