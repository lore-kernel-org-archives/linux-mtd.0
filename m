Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQIey-00032Q-Sp
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 04:12:25 -0400
Message-ID: <46D52961.4080908@parrot.com>
Date: Wed, 29 Aug 2007 10:08:01 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: He Yong <hoffer1127@gmail.com>
Subject: Re: mtd->size overflow
References: <d843180a0708282321v62662b56h63249d5459b3a3b5@mail.gmail.com>	<9b52d64c0708282351o4defa2edrdfc295488e20d6c4@mail.gmail.com>
	<d843180a0708290011t64221292hb5d0dfc365fa78b9@mail.gmail.com>
In-Reply-To: <d843180a0708290011t64221292hb5d0dfc365fa78b9@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vinit Agnihotri <vinit.agnihotri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 2007/8/29, Vinit Agnihotri <vinit.agnihotri@gmail.com>:
>> I had same problem,
>> I converted entire mtd sunsytem to work with 64-bit compatibility.
>> You have make fields from mtd_info, erase_info & 2 more structures to 64-bits
>> these fields are size, offset & similar ones...
Or you could sift the size field, because I bet you never have 1B flash...


Matthieu
