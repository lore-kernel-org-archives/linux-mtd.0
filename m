Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoJLo-00088K-Bm
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 18:05:57 +0000
Received: by wwf22 with SMTP id 22so18896wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 11:05:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGq3pz7i3mBnLjK+wne5sgkk2ko4d8K8571eFvD8Y=X6CpU=PA@mail.gmail.com>
References: <CAGq3pz4LHRkCqaJfqoMYe-=mn+s5CVZipab7bd8F3z+ou3xxVA@mail.gmail.com>
	<CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
	<CAGq3pz7i3mBnLjK+wne5sgkk2ko4d8K8571eFvD8Y=X6CpU=PA@mail.gmail.com>
Date: Tue, 2 Aug 2011 11:05:54 -0700
Message-ID: <CAN8TOE-c8f46PCtJx5jhp=s61SxTwep-t2YdybDnTYYufbOT-g@mail.gmail.com>
Subject: Re: MTD-related kobject badness during linux-next boot
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 2, 2011 at 10:58 AM, Daniel Drake <dsd@laptop.org> wrote:
> On 2 August 2011 18:40, Brian Norris <computersforpeace@gmail.com> wrote:
>> Have you tried linux 3.0, which does not have the patch series that
>> messes with mtd partition parsing and registering?
>
> Yes, and the problem does not appear there.

As expected. Then let's wait and see if anyone has comments on my patch.

Brian
