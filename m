Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF98h-0005hG-SF
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 07:39:58 -0400
Message-ID: <4326BA88.4050908@inf.u-szeged.hu>
Date: Tue, 13 Sep 2005 13:39:52 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <43258B3B.7060405@intefo.ch> <4326B6F4.1030709@inf.u-szeged.hu>
	<4326B8FA.5030608@yandex.ru>
In-Reply-To: <4326B8FA.5030608@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
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

Hi Artem,

Artem B. Bityuckiy wrote:
> I wonder, why don't you do the same trick that I did for fragtree build 
> messages and the like, (see debug.h) to be able on/off your summary 
> messages independently. Believe me, this is very handy to have a 
> possibility to filter unneeded flood.

We are already using it. I rewrote our debug messages to use your debug 
stuff before commiting the patch, and added a "#define 
JFFS2_DBG_SUMMARY_MESSAGES" into debug.h. (or do you think about an 
other thing?)

I agree, it is really usefull.

Ferenc
