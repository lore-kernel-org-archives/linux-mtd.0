Received: from www.llwyncelyn.cymru ([82.70.14.225] helo=fuzix.org)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2amL-0000Vt-Jo
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 10:31:51 +0000
Date: Thu, 12 Oct 2017 11:31:01 +0100
From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20171012112959.4d2310a8@alans-desktop>
In-Reply-To: <1507292755.29211.353.camel@infradead.org>
References: <20170923201314.GA14742@amd> <9307201.RrdVcHfbLZ@blindfold>
 <20171006115514.GF9497@amd> <5423699.qLmXvRyVVn@blindfold>
 <1507291276.29211.350.camel@infradead.org>
 <20171006121359.GA14435@amd>
 <1507292755.29211.353.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 06 Oct 2017 13:25:55 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2017-10-06 at 14:13 +0200, Pavel Machek wrote:
> > > You can change 'C++' to 'C99' too, while you're at it :)  
> >
> > No. They are C++ comments... as in... dangerous infection that came
> > from C++. Yes, C99 is infected, too, but still C++ is original source
> > of infection :-).  
> 
> C++ is a different language, and irrelevant here. You could call them
> Java comments if you want, but that would be equally silly. In the
> kernel, they are C99 comments. Valid, but not our preferred style
> (which is fair enough, unlike our idiotic refusal to use C99 integer
> types).

We might as well allow them. We are using those compiler settings so the
cases where your compilation produces different results in C99 and more
classic C are no longer a risk 8)


int main(int argc, char *argv[])
{
	int x = 1//**/
	-1;

	if (x == 0)
		puts("Ewww C99");
	exit(0);
}
