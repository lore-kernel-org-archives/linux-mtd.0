Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoTEs-0000Fa-5Q
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 00:53:34 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1833322wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Apr 2008 17:53:32 -0700 (PDT)
Message-ID: <9c9fda240804221753q518ab71aj1c8f7a356009abcb@mail.gmail.com>
Date: Wed, 23 Apr 2008 09:53:31 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: inconsistent behaviour with onenand with 2.6.24 kernel
In-Reply-To: <480C516A.5030105@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
	<48084B80.2050601@nokia.com>
	<60e9ed290804202339v14b04468hafdbc9e088bee4fe@mail.gmail.com>
	<480C516A.5030105@nokia.com>
Cc: linux-mtd@lists.infradead.org, Abhijit Singh <mail2abhijit@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 21, 2008 at 5:33 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Abhijit Singh wrote:
>  > I have tried all the above mentioned patches. But the status is same.
>  > behaviour is inconsistent.
>  > It still leads to system hangs while writing big files. Any other pointers ?
>  > But it is working fine on 2.6.20 kernel.
>
>  That was the only problem I knew of.
>
>  You will need to dump the task list (using sysrq) when it hangs and try
>  to work out where it is stuck.
>

To verify which has a bug, try to another approaches,
Could you replace 2.6.20 OneNAND driver with 2.6.24. or vice versa, If
the problem is same, it's OneNAND bug.
If not, it could be another problem. not OneNAND drivers.

Thank you,
Kyungmin Park
