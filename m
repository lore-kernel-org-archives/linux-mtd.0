Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FGaJb-0002ND-OL
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 06:25:38 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <440D68CA.7090002@inf.u-szeged.hu>
References: <43FAEFD6.1090308@inf.u-szeged.hu> <440C7D45.9080406@yandex.ru>
	<440D68CA.7090002@inf.u-szeged.hu>
Content-Type: text/plain
Date: Tue, 07 Mar 2006 14:24:41 +0300
Message-Id: <1141730681.3920.8.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: A simple JFFS3 GC algorithm
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-03-07 at 12:04 +0100, Ferenc Havasi wrote:
> If we don't work with regions smaller than 256K, than a size of the map
> of a 16G flash is about 786K, which I think is still OK, and also can be
> cached.
Providing this number is correct, indiid, not too much.

> It is stored on the flash somewhere (its position is in the superblock),
> and the changes are logged into a separated journal. When this journal
> is fulled, the new version of map will be written out. If the file
> system is mounted the stored map will be loaded and the events stored in
> the journal are replayed.
Hmm. Could you please add more detailed description to your document
about how we could maintain this map on flash, that journal, etc?

> Anyway, we don't insist on this algorithm, it was only an idea, maybe
> not usefull. We've started to implement a simplified user space
> prototype of JFFS3, specially for testing different kind of garbage
> collecting methods.
> 
Cool!

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
