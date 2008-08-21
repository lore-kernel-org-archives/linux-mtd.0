Received: from py-out-1112.google.com ([64.233.166.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWGRn-0004T9-9M
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 20:07:55 +0000
Received: by py-out-1112.google.com with SMTP id a73so187576pye.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 13:07:54 -0700 (PDT)
Message-ID: <6934efce0808211307g4eabe29fvac24d82252bf913c@mail.gmail.com>
Date: Thu, 21 Aug 2008 13:07:54 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Daniel Walker" <dwalker@mvista.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
In-Reply-To: <1219324258.23311.14.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00E6.2070505@gmail.com>
	<1219324258.23311.14.camel@localhost.localdomain>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I think it would be much cleaner to do all these similar macro's as
> static inline functions.

Yeah.  Been thinking about that.
