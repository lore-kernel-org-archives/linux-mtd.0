Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEaOr-0005lW-6C
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 17:02:04 -0500
Received: by wproxy.gmail.com with SMTP id 37so582474wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 14:01:55 -0800 (PST)
Message-ID: <6934efce050324140163fbe8d4@mail.gmail.com>
Date: Thu, 24 Mar 2005 14:01:55 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0503240918120.15561@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
	<6934efce0503231727f7234f6@mail.gmail.com>
	<Pine.LNX.4.58.0503240918120.15561@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & deletion dirents RFC
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> We can't get rid of version in data nodes.

I'm not suggesting we get rid of 'version' in the actual nodes.

As I understand this adding 'version' to struct jffs2_raw_node_ref
increases the RAM usage by N*(X+Y) where:
  N is the size of the version field
  X is the number of direnties
  Y is the number of data nodes

It seems there "ought" to be a way to only increase RAM size by N*X. 
I'm assuming Y>>X so this could be a big factor for RAM usage.

Am I missing something?

 ,Jared
