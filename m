Message-ID: <4919340A.8070300@nokia.com>
Date: Tue, 11 Nov 2008 09:28:10 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
	<000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
	<9c9fda240810091557j529495d5q284a8ab0e0d752dd@mail.gmail.com>
	<1224331498.6770.1362.camel@macbook.infradead.org>
	<000001c93271$5c6ab4c0$3dd66c6b@sisodomain.com>
	<1224482040.4466.73.camel@sauron>
	<000301c93411$74627df0$3dd66c6b@sisodomain.com>
	<4901DB27.4020401@nokia.com>
	<000901c93d9f$7c7ed0f0$3dd66c6b@sisodomain.com>
	<49115EC6.9090800@nokia.com> <49145004.9010202@samsung.com>
	<49185137.4040300@nokia.com>
	<6E87DF51DE3C4BC49C27B7FC516D051B@sisodomain.com>
In-Reply-To: <6E87DF51DE3C4BC49C27B7FC516D051B@sisodomain.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Rohit <h.rohit@samsung.com>, 'Kyungmin Park' <kmpark@infradead.org>,
	apgmoorthy <moorthy.apg@samsung.com>,
	'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amit Kumar Sharma wrote:
> we will share iozone result on flexOneNand but during 
> testing of  FlexOneNand on kernel 2.6.22 performance results 
> are far better then 2.6.27 still we donot know the reasons.
> we checked performance for OneNand on same kernel veriosn 
> but OneNand also has down performance with 2.6.27 kernel 
> version.still a question for us?

There have been performance regressions in the kernel since
2.6.22 related to the scheduler among other things.  2.6.28
should be better.
